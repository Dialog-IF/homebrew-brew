class Aamachine < Formula
  desc "Support for the Aa-machine virtual machine for Interactive Fiction"
  homepage "https://github.com/Dialog-IF/aamachine"
  url "https://github.com/Dialog-IF/aamachine/releases/download/release-1.0.1/aamachine-1.0.1.zip"
  sha256 "2413c14130e3bc1462cb4ef35abd75dbfe3a2a770a6308160671dec3e440990d"

  def install
    chdir "prebuilt/macos-universal" do
      bin.install "aambundle", "aamshow", "aamrun"
    end
    prefix.install "readme.txt", "license.txt"
  end
end
