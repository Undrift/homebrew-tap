class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.7/drift-darwin-arm64"
      sha256 "5467c5615c7ead3288757eef648f676e287c5a0f09f95247bf37abdaea091913"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.7/drift-darwin-amd64"
      sha256 "7a072390954be2126ef95db45dcb6379713f78887f0eb267b1b88d74860251ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.7/drift-linux-arm64"
      sha256 "1cfaa0f5d68f9cab1c69cb8952068887845ce8b8ec5014d9f8607b608e06868f"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.7/drift-linux-amd64"
      sha256 "13353916e5ea350c31c381e292a75d57611c450a8451a8dbb748491d59ba2ad3"
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
