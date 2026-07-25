class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.3/drift-darwin-arm64"
      sha256 "b58761c31cb4a471526ebf4caebaa9cab04dac15e69fa10c1ac9b41cb344b8d9"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.3/drift-darwin-amd64"
      sha256 "af34998ddcc6f87399683a434e833c4d17340778e8e9586f3ca48aa28ae74097"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.3/drift-linux-arm64"
      sha256 "56dd4a959f6c11b2008beca4a525cb9eee74847b85d80d40a8d425263080bb19"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.3/drift-linux-amd64"
      sha256 "6980710df39e2008afc07473fa66ada263eba8e218dff7dacd573c7c76b69cb3"
    end
  end

  def install
    binary_name = "drift-darwin-arm64"
    if OS.mac? && Hardware::CPU.intel?
      binary_name = "drift-darwin-amd64"
    elsif OS.linux? && Hardware::CPU.arm?
      binary_name = "drift-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      binary_name = "drift-linux-amd64"
    end

    bin.install binary_name => "drift"
  end

  test do
    system "#{bin}/drift", "--version"
  end
end
