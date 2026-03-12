class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.1/drift-darwin-arm64"
      sha256 "c6f3c4eef32aef0a3e18e16a707420200c3691377645ef0b429b57eefe6234d3"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.1/drift-darwin-amd64"
      sha256 "4191e384b9b110a4e7e301f5bdef1d4192df33177018e734a21525a292e32c91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.1/drift-linux-arm64"
      sha256 "e068a442af32bfdb843d59210a656906107bb0c7c47c225b541def0a9c77dd0a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.1/drift-linux-amd64"
      sha256 "6fc993bc5511117b5daea4ba6c6c57f69c08150f12c920e3eb311e2ca218bf90"
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
