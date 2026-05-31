class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://github.com/dialog-if/dialog/"
  url "https://github.com/Dialog-IF/dialog/releases/download/release-1c01-1.2.2/dialog-1c01-1.2.2.zip"
  version "1c01-1.2.2"
  sha256 "ac8bb9dede11eadcce416c23bc564eaac8d7520166363c03f59a1b8096084837"

  def install
    chdir "src" do
      system "make"
      bin.install "dgdebug", "dialogc"
    end
    doc.install Dir["docs/*"]
    prefix.install "readme.txt", "license.txt"
    pkgshare.install "stdlib.dg", "stddebug.dg", "unit.dg"
  end

  test do
    (testpath/"test.dg").write("(program entry point) hello world")
    system bin/"dialogc", "-tz8", "test.dg"
    assert_path_exists testpath/"test.z8"
  end
end
