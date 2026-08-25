class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.0/drift-darwin-arm64"
      sha256 "80998ebbb1e011dd60851a7092546f640cfda292c82569e2a4b732362fa4e452"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.0/drift-darwin-amd64"
      sha256 "0b954a4ff21ec538cd2b73dae194daf70b75b0c87bdc677dc736c0f398c728ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.0/drift-linux-arm64"
      sha256 "ddaffbfc5b6618014442d0aaeb4b8d74f2b63fd788f07d0b061846963b7e3666"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.0/drift-linux-amd64"
      sha256 "8bbfdaee37bfb4293469147db6cc026b08390f00bcc8c2e6d830e84e6082e23a"
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
