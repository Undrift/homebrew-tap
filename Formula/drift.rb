class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.1/drift-darwin-arm64"
      sha256 "8f96fbd574169dbd7a1ba6f3801c3b0d63f00ee70174f6b22620069caa325bc5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.1/drift-darwin-amd64"
      sha256 "38eb7645ced07ed8876fbb7e5cdfdb4a0abaa95d7dc3bac22aa98efb28e8e39c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.1/drift-linux-arm64"
      sha256 "cef279bd4341ff2b611e14de4ee94a3481abe7ea3c6c3fc63f571b3acc5b2b8e"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.14.1/drift-linux-amd64"
      sha256 "a9a110877a47eff5b7664e23a265e89d8cc9658e1bd472f0313dcd71f314ecf2"
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
