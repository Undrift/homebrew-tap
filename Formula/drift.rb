class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.4/drift-darwin-arm64"
      sha256 "100ed0ba5770c7b3b9fc7258a9745ab027bf719d26d5b077bb4016053c0e822d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.4/drift-darwin-amd64"
      sha256 "1e7b69348da72dc71b6dcb7bebbb430d5869d399292a75820579129f27b0e945"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.4/drift-linux-arm64"
      sha256 "fe7430c63c979137412d85a63d980f64bb0baea9b2b9ce75c5f908bd784cb07c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.4/drift-linux-amd64"
      sha256 "b8fe085c21312a3017b602e4d4956749477591d1187f76fc40e2641416211d49"
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
