class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.0/drift-darwin-arm64"
      sha256 "10d254a5ea9d17f1a218b62f9bc8d18cfbed308cc2aed7fb0ca120af3a124982"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.0/drift-darwin-amd64"
      sha256 "6b759e4dfd8abb3e72b2ab43b2d2545aa2b20f971125f05fd980128ab58151e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.0/drift-linux-arm64"
      sha256 "4f0d9f3ccf8a551d49fd3f890364f9e0e21ebae0c0cf98dc174a3c411239d5f8"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.0/drift-linux-amd64"
      sha256 "5ddafbf5d1a921e53206b6ab38aa59dd59cec39d138182c6503e73084e862d71"
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
