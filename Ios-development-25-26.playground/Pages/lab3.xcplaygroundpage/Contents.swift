import Foundation

enum ProductError: Error {
    case invalidPrice
}

enum CartItemError: Error {
    case invalidQuantity
}


struct Product {
    enum Category: String {
        case electronics, clothing, food, books
    }

    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String

    var displayPrice: String {
        // форматирование
        String(format: "$%.2f", price)
    }

    init(id: String = UUID().uuidString,
         name: String,
         price: Double,
         category: Category,
         description: String = "") throws {
        guard price >= 0 else {
            throw ProductError.invalidPrice
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}


struct CartItem {
    let product: Product
    private(set) var quantity: Int

    var subtotal: Double {
        return product.price * Double(quantity)
    }

    init(product: Product, quantity: Int = 1) throws {
        guard quantity > 0 else { throw CartItemError.invalidQuantity }
        self.product = product
        self.quantity = quantity
    }

    mutating func updateQuantity(_ newQuantity: Int) throws {
        guard newQuantity > 0 else { throw CartItemError.invalidQuantity }
        self.quantity = newQuantity
    }

    mutating func increaseQuantity(by amount: Int) throws {
        guard amount > 0 else { throw CartItemError.invalidQuantity }
        self.quantity += amount
    }
}


enum DiscountCode {
    case percentage(Double)   // 0.10 for 10%
    case fixed(Double)        // fixed amount off

    static func from(code: String) -> DiscountCode? {
        let c = code.uppercased()
        if c == "SAVE10" { return .percentage(0.10) }
        if c == "SAVE20" { return .percentage(0.20) }
        if c == "TAKE5"  { return .fixed(5.0) }
        return nil
    }
}


class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?

    init() {}

    //find index of item by product id
    private func indexOf(productId: String) -> Int? {
        return items.firstIndex { $0.product.id == productId }
    }

    func addItem(product: Product, quantity: Int = 1) {
        // if item exists — increase quantity
        if let idx = indexOf(productId: product.id) {
            var item = items[idx]
            do {
                try item.increaseQuantity(by: quantity)
                items[idx] = item
            } catch {
                print("Invalid quantity when increasing")
            }
        } else {
            do {
                let newItem = try CartItem(product: product, quantity: quantity)
                items.append(newItem)
            } catch {
                print("Cannot add item: invalid quantity")
            }
        }
    }

    func removeItem(productId: String) {
        if let idx = indexOf(productId: productId) {
            items.remove(at: idx)
        } else {
            //Not found nothing to remove
        }
    }

    func updateItemQuantity(productId: String, quantity: Int) {
        if let idx = indexOf(productId: productId) {
            do {
                if quantity == 0 {
                    // remove if quantity set to 0
                    items.remove(at: idx)
                } else {
                    var item = items[idx]
                    try item.updateQuantity(quantity)
                    items[idx] = item
                }
            } catch {
                print("Invalid quantity provided")
            }
        } else {
            print("Item not found in cart")
        }
    }

    func clearCart() {
        items.removeAll()
    }

    var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal }
    }

    var discountAmount: Double {
        guard let code = discountCode, let discount = DiscountCode.from(code: code) else {
            return 0.0
        }
        switch discount {
        case .percentage(let pct):
            return subtotal * pct
        case .fixed(let amount):
            return min(amount, subtotal)
        }
    }

    var total: Double {
        return subtotal - discountAmount
    }

    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }

    var isEmpty: Bool {
        return items.isEmpty
    }
}


struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String

    var formattedAddress: String {
        return "\(street)\n\(city), \(zipCode)\n\(country)"
    }
}


struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address

    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        //CartItem is struct -> value copy
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }

    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
}


class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order] = []

    init(userId: String = UUID().uuidString, name: String, email: String) {
        self.userId = userId
        self.name = name
        self.email = email
    }

    func placeOrder(_ order: Order) {
        orderHistory.append(order)
    }

    var totalSpent: Double {
        return orderHistory.reduce(0) { $0 + $1.total }
    }
}


do {
    //create products
    let laptop = try Product(name: "Laptop Pro", price: 1299.99, category: .electronics, description: "Powerful laptop")
    let book = try Product(name: "Swift Guide", price: 39.99, category: .books, description: "Learn Swift")
    let headphones = try Product(name: "Headphones", price: 199.0, category: .electronics)
    let apple = try Product(name: "Apple", price: 0.99, category: .food)
    // create cart
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    // add same product again -> increase quantity
    cart.addItem(product: laptop, quantity: 1) // laptop quantity becomes 2

    print("After adding items:")
    print("Item count (total pieces):", cart.itemCount)
    print("Subtotal:", cart.subtotal)
    print("--- Items in cart ---")
    for item in cart.items {
        print("\(item.product.name) x\(item.quantity) — subtotal \(String(format: "$%.2f", item.subtotal))")
    }
    //apply discount
    cart.discountCode = "SAVE10"
    print("Discount code:", cart.discountCode ?? "none")
    print("Discount amount:", String(format: "$%.2f", cart.discountAmount))
    print("Total:", String(format: "$%.2f", cart.total))

    //remove an item
    cart.removeItem(productId: book.id)
    print("After removing book — itemCount:", cart.itemCount)

    //reference behavior
    func modifyCart(_ c: ShoppingCart) {
        c.addItem(product: headphones, quantity: 1)
    }
    modifyCart(cart)
    print("After modifyCart called — itemCount:", cart.itemCount)

    //value type behavior
    var item1 = try CartItem(product: laptop, quantity: 1)
    var item2 = item1
    try item2.updateQuantity(5)
    print("item1.quantity:", item1.quantity, "item2.quantity:", item2.quantity)

    // create order snapshot
    let address = Address(street: "123 Main St", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
    let order = Order(from: cart, shippingAddress: address)
    print("Order created with id:", order.orderId)
    print("Order itemCount:", order.itemCount)

    // clear cart after order
    cart.clearCart()
    print("After clearing cart — cart itemCount:", cart.itemCount)
    print("Order still has items:", order.itemCount)

    // user & order history (bonus)
    let user = User(name: "Alisher", email: "a@example.com")
    user.placeOrder(order)
    print("User total spent:", String(format: "$%.2f", user.totalSpent))

    
} catch {
    print("Initialization error:", error)
}



