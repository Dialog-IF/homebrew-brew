class Aamachine < Formula
  desc "Support for the Aa-machine virtual machine for Interactive Fiction"
  homepage "https://github.com/Dialog-IF/aamachine"
  url "https://github.com/Dialog-IF/aamachine/releases/download/release-1.0.0/aamachine-1.0.0.zip"
  sha256 "sha256:9b35da6b3c8c98e5bff3dfadd3ad1fca0c1b020ffb02b46c30be94858ac487f7"

  def install
    chdir "src" do
      system "make"
      bin.install "aambundle", "aamshow"
    end
    prefix.install "readme.txt", "license.txt"
  end
end
