class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.6/drift-darwin-arm64"
      sha256 "3abdc8e26d97797a99692ae6b51484599f34a9cb0f831e81f78e205b8de33be6"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.6/drift-darwin-amd64"
      sha256 "210d1b38523a53d489273f5e192d5f7ae804cca8e5d5a261d58085ead32a30a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.6/drift-linux-arm64"
      sha256 "576b390b1394da0564c74e698d2098d754beda2455d5244664742ec2e7fac761"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.6/drift-linux-amd64"
      sha256 "3d776b17dd1f51694b6ab7a83e59063bba04c90e24c023fadf75935d48e596a8"
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
