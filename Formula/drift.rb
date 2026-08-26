class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.1/drift-darwin-arm64"
      sha256 "e7f6d7fc79125c52d00777503e36ca6e7b9d369d770d98c6c59afec3d560174c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.1/drift-darwin-amd64"
      sha256 "95e6361dd4af235aab304251906ee154c75ce029c01d244d4f035c49585bbaa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.1/drift-linux-arm64"
      sha256 "0e689fbdeb04a5f982ff1d6e9142562b94d9411dc9c7459d3ef0a33e853b4e4a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.1/drift-linux-amd64"
      sha256 "b1e098783f9fbaefafd50c76275550fc71d0929d9cf3219f7ac6a1b0e881f0fb"
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
