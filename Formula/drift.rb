class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.4.0/drift-darwin-arm64"
      sha256 "fc6519c0367bd193ea0f7481ff1df3316b030b02adc0e6d67ae844bd7d0e4009"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.4.0/drift-darwin-amd64"
      sha256 "e27e0cda0852ae8fb74dfbe6c000436d05adac8db12f0fb5d6c3bd5390179f30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.4.0/drift-linux-arm64"
      sha256 "320e638a53501e70f4486ec3f292b0f081e8e7531130987608c8f5bb40aa7a8d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.4.0/drift-linux-amd64"
      sha256 "3c008ad8645106c42cf8f4c4c622aae62ca83206a42bc1806ee1083f5a57db01"
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
