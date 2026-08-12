class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.3.0/drift-darwin-arm64"
      sha256 "a36aa2e9ac81b73e92e6d847072d193ef697850190c21b27f54cc7f3357f002a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.3.0/drift-darwin-amd64"
      sha256 "71ddb1a1666812107e8be2aa30f8361885618f80d58b8e841495bf9fa3a3f286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.3.0/drift-linux-arm64"
      sha256 "2bd1effe47a0dff8c969c8e08f5bcf4df002be02dc20ab96e21687484f8fa092"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.3.0/drift-linux-amd64"
      sha256 "e99f7f98e250f069b6d6c20f861039aa2f606c213467252725bc4a485e9d4c85"
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
