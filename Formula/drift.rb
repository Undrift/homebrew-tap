class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.11.0/drift-darwin-arm64"
      sha256 "43a2290e4491dceda13fda645d70d95808657dd23646184e3c4684140e97cd61"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.11.0/drift-darwin-amd64"
      sha256 "9e73983707acfe0fff2b268bacd1b5e31f53a4fa9ef28d9b0f8a7cde32c35fb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.11.0/drift-linux-arm64"
      sha256 "6b229221fb92610767a4fa622da6ed3547c9bb7aed9ebbae09c5bb568ec9fa22"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.11.0/drift-linux-amd64"
      sha256 "bc51c62953e5943c8bb4f10098cf66ecbfd801d01e07849fc2672be1632655ff"
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
