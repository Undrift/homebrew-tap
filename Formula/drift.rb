class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.3/drift-darwin-arm64"
      sha256 "dcd96278392332b7ea60ecbf7e4542623e8d07921cf46156a87a7516ad1d52df"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.3/drift-darwin-amd64"
      sha256 "20bd7956c85958fea97c36c369f759b11e4872dec2645ee172ce568cfaad1215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.3/drift-linux-arm64"
      sha256 "7228fe301a9a134940aa4acca858a84c83dc9721419a98b02a053331be6e091a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.3/drift-linux-amd64"
      sha256 "89c577dac9b39f7e0507afcb33f56b17abda4647b6e645ff4524ce7015919612"
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
