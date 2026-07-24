class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.0/drift-darwin-arm64"
      sha256 "c083aeb1f7ee8b31ea0bff181f207c80dea9946387427f538904137347d4f244"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.0/drift-darwin-amd64"
      sha256 "8649348a2674a70fe933e23442f6ad7182a838d98a209cc546558b93e7e33752"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.0/drift-linux-arm64"
      sha256 "f342986a01693ac2ce74558f71680fbcaf35b34f52ea924c59035de2a60eb8cd"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.0/drift-linux-amd64"
      sha256 "f004cc486858e3ce8d5ae8d90d3999719d2581296f19d43b69224c6cc6c1f6ed"
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
