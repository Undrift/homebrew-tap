class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.4/drift-darwin-arm64"
      sha256 "dafb14e72c6a02aa50725f630ceffcd26ec535476290844b2d4299f8ee53602c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.4/drift-darwin-amd64"
      sha256 "78094ae30d834eeee4d5265dc9dfa77c69640e4964db3c400629650650009e02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.4/drift-linux-arm64"
      sha256 "f679c8f82d0186df8f0588419f2358ba73b5101cc363c4b64b5b80c8f392c0c2"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.4/drift-linux-amd64"
      sha256 "9aee64229028a57be3091dbae0fae43e43a5e192ebe599f0671aa7c10113a7b3"
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
