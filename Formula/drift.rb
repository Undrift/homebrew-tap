class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.1/drift-darwin-arm64"
      sha256 "142f140f69b89ebd1b3a94bdcc5a4934f8632b8062e6d386a5a29c16cd4b6f9f"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.1/drift-darwin-amd64"
      sha256 "5a11ddd9d264b0fc38530cc079632183b7d1baeada73a29e0c6a3cba7d447119"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.1/drift-linux-arm64"
      sha256 "21d0945044f3beab8d6a563d7868c40dc9c0209058f4c042e6e67b01dfb85e3a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.1/drift-linux-amd64"
      sha256 "fcddf5dc528dd0b6155d31c4e6a70ebff08efe232fda17834039a103648646b6"
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
