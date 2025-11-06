import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var playlist: [Track] = [
        Track(title: "Love Me", artist: "Lil Wayne ft. Drake & Future", coverImageName: "cover1", audioFileName: "track1"),
        Track(title: "Jumpman", artist: "Drake & Future", coverImageName: "cover2", audioFileName: "track2"),
        Track(title: "BAND4BAND", artist: "Central Cee ft. Lil Baby", coverImageName: "cover3", audioFileName: "track3"),
        Track(title: "Up Down (Do This All Day)", artist: "T-Pain ft. B.o.B", coverImageName: "cover4", audioFileName: "track4"),
        Track(title: "I Wanna Love You", artist: "Akon ft. Snoop Dogg", coverImageName: "cover5", audioFileName: "track5")
    ]
    
    private var currentIndex = 0
    private var audioPlayer: AVAudioPlayer?
    private var progressTimer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack(at: currentIndex, autoplay: false)
    }
    
    
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        guard !playlist.isEmpty else {
            return
        }
        
        currentIndex = (currentIndex - 1 + playlist.count) % playlist.count
        loadTrack(at: currentIndex, autoplay: audioPlayer?.isPlaying ?? false)
        
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        guard let player = audioPlayer else {
            loadTrack(at: currentIndex, autoplay: true)
            return
        }
        player.isPlaying ? pausePlayback(): resumePlayback()
        print("play pause knopku nazhali")
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard !playlist.isEmpty else {
            return
        }
        currentIndex = (currentIndex + 1) % playlist.count
        loadTrack(at: currentIndex, autoplay: audioPlayer?.isPlaying ?? false)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        guard let player = audioPlayer else {
            return
        }
        
        player.currentTime = TimeInterval(sender.value)
        currentTimeLabel.text = formattedTime(player.currentTime)
    }
    

    private func loadTrack(at index: Int, autoplay: Bool) {
        stopPlayback()
        guard playlist.indices.contains(index) else {
            return
        }
        
        let track = playlist[index]
        coverImageView.image = track.coverImage
        trackTitleLabel.text = track.title
        artistNameLabel.text = track.artist
        
        currentTimeLabel.text = "00:00"
        totalTimeLabel.text = "--:--"
        progressSlider.minimumValue = 0
        progressSlider.value = 0
        
        var url: URL?
        
        url = Bundle.main.url(forResource: track.audioFileName, withExtension: "mp3")
        if url == nil {
            url = Bundle.main.url(forResource: track.audioFileName, withExtension: nil)
        }
        if url == nil {
            url = Bundle.main.url(forResource: "tracks/\(track.audioFileName)", withExtension: "mp3")
        }
        
        
        if let audioURL = url {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.delegate = self
                audioPlayer?.prepareToPlay()
                
                progressSlider.maximumValue = Float(audioPlayer?.duration ?? 0)
                totalTimeLabel.text = formattedTime(audioPlayer?.duration ?? 0)
                
                if autoplay {
                    resumePlayback( )
                } else {
                    updatePlayPauseButtonIcon(isPlaying: false)
                }
                
                print("trek zagruzhen: \(track.title)")
                
            } catch {
                print("oshibka zagruzki treka: \(error)")
                audioPlayer = nil
                updatePlayPauseButtonIcon(isPlaying: false)
            }
        } else {
            print("file ne naiden: \(track.audioFileName)")
            audioPlayer = nil
            progressSlider.maximumValue = 1
            updatePlayPauseButtonIcon(isPlaying: false)
            
        }
        
    }
    
    private func resumePlayback() {
        audioPlayer?.play()
        startProgressTimer()
        updatePlayPauseButtonIcon(isPlaying: true)
    }
    
    private func pausePlayback() {
        audioPlayer?.pause()
        stopProgressTimer()
        updatePlayPauseButtonIcon(isPlaying: false)
    }
    
    private func stopPlayback() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        stopProgressTimer()
        progressSlider.value = 0
        currentTimeLabel.text = "00:00"
        updatePlayPauseButtonIcon(isPlaying: false)
    }
    
    private func startProgressTimer() {
        stopProgressTimer()
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let self, let player = self.audioPlayer else { return }
            self.progressSlider.value = Float(player.currentTime)
            self.currentTimeLabel.text = self.formattedTime(player.currentTime)
        }
    }
    private func stopProgressTimer() {
        progressTimer?.invalidate()
        progressTimer = nil
        
    }
    
    private func updatePlayPauseButtonIcon(isPlaying: Bool) {
        let symbolName = isPlaying ? "pause.circle.fill" : "play.circle.fill"
        playPauseButton.setImage(UIImage(systemName: symbolName), for: .normal)
        
    }
    
    private func formattedTime(_ value: TimeInterval) -> String {
        guard value.isFinite else {return "--:--"}
        let minutes = Int(value) / 60
        let seconds = Int(value) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        currentIndex = (currentIndex + 1) % playlist.count
        loadTrack(at: currentIndex, autoplay: true)
    }


}

