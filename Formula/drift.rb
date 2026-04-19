class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.10.0/drift-darwin-arm64"
      sha256 "92c9beaae0f98d73e7e5f56d1eb389213b3e7fc55e03e8813f75e58cb8c09f13"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.10.0/drift-darwin-amd64"
      sha256 "6b9b7265e1c11e8a73e3da55e9903d8671dc00e4127281ce65d61667c4126f1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.10.0/drift-linux-arm64"
      sha256 "c21bb18dbfcd674133cce00d82bda721aba37c0f44c53edd8eb2dfdb8423908c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.10.0/drift-linux-amd64"
      sha256 "15bcc60760a33252e0e73be9e54312afc874da46c67f92b6672fc7064f03b93a"
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
