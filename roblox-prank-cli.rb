class RobloxPrankCli < Formula
  desc "A prank CLI tool that simulates Roblox actions"
  homepage "https://github.com/ajcodepranks/roblox-prank-cli"
  url "https://github.com/ajcodepranks/roblox-prank-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "your-tarball-sha256"

  def install
    bin.install "roblox-prank-cli.sh" => "roblox-cli.sh"
    bin.install "roblox-prank-cli.zsh" => "roblox-cli.zsh"
    (bin/"roblox-cli").write <<~EOS
      #!/bin/bash
      if [ -n "$ZSH_VERSION" ]; then
        exec #{bin}/roblox-cli.zsh "$@"
      else
        exec #{bin}/roblox-cli.sh "$@"
      fi
    EOS
  end

  test do
    system "#{bin}/roblox-cli", "--help"
  end
end
