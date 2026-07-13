class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.0/drift-darwin-arm64"
      sha256 "b7cfcefdd0e194e37de4f1ce68dd39dbddc2e149ba59bd9d7cb7cef50c1c94c4"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.0/drift-darwin-amd64"
      sha256 "4b9ba23c3f7f64090977b5fd86730ad06d133875bec997e96e82a7b18d0d72fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.0/drift-linux-arm64"
      sha256 "da35ea96f5215e14e946db96478b4d1cfec207a0cf09b99180ee2ce2431b6e74"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.0/drift-linux-amd64"
      sha256 "0b44621f45f0c92de8614e5122b2f30949888ae5da103c82b4a2f12d8c7238ed"
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
