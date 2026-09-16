class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.5/drift-darwin-arm64"
      sha256 "ff413e8b0df369a27791c45676d1aac46bb83d6fbf600cd707fa652685cb4746"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.5/drift-darwin-amd64"
      sha256 "6665306184e84af5a68540cba6fbc2cff4e6956bfc9f4a0c7a9fce1ac1ff6a4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.5/drift-linux-arm64"
      sha256 "344e50562d204cdba858a1266868ea9a3bad5429427ee1a3baf8c6238a78cc4b"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.5/drift-linux-amd64"
      sha256 "d76ddaaa22db3798bbc896df53586a362eb7d5544afa590a31505b5f2683c578"
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
