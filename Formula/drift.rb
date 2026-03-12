class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.2/drift-darwin-arm64"
      sha256 "f964b0b14652ddd032a189fc7609ac8955a01c8124b4ea24b8721e8688cb41c5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.2/drift-darwin-amd64"
      sha256 "10dde79feb0bab92ede9d8b706954a815323b9e6aa34f4d8daf99f457ca1f806"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.2/drift-linux-arm64"
      sha256 "8c2f0018b02730552cc9019a14af8b029aa16735f0711f5b6e67216a5020480e"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.2/drift-linux-amd64"
      sha256 "d631a7b981ae4e141292c8ec56da7010d5bedb495fe9f230d7fd2dd93d9c50e2"
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
