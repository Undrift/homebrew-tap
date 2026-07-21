class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.2/drift-darwin-arm64"
      sha256 "6b69910c0e5542cc1eb5451191d35243340679255cb190abaed3b45fe4d2b569"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.2/drift-darwin-amd64"
      sha256 "1fe1b00c8e40127c14864412182e98444c2f74a7e3a6327241ee198596c88df7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.2/drift-linux-arm64"
      sha256 "8f962889aa63aa577be2a5d57d8c17548810ec7d5122cd4e62cd632c8bdfba72"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.2/drift-linux-amd64"
      sha256 "c912d7e7d3786cabcf2750a4a486d4570ae14c7c10969b66e80b7d71d1b4ff39"
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
