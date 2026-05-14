class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://github.com/dialog-if/dialog/"
  url "https://github.com/Dialog-IF/dialog/releases/download/release-1b02-1.2.1/dialog-1b02-1.2.1.zip"
  version "1b02-1.2.1"
  sha256 "a634f9bee3a44f86473ecc51321aeada72b966998c22ea8dfe3af8b658254b12"

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
