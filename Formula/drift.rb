class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.8/drift-darwin-arm64"
      sha256 "2c3b475101a4df5f06ad8d4ac838f414e8986c6101a9eaf194742e63eb8bb007"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.8/drift-darwin-amd64"
      sha256 "02049a31cb52f48bc0caf8a44bf67479dbdb0aa3b4af28b10ac365c908942551"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.8/drift-linux-arm64"
      sha256 "452cc4072eafb671058b0399ecc24a9ecad9ae5da6924e988b018722ed498d5d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.8/drift-linux-amd64"
      sha256 "0affb7812cc1644225f35f75006b6a4494aea95248b00b8d85556370367e0399"
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
