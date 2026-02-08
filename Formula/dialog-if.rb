class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://github.com/dialog-if/dialog/"
  url "https://github.com/Dialog-IF/dialog/releases/download/release-1a01-1.1.0/dialog-1a01-1.1.0.zip"
  version "1a01-1.1.0"
  sha256 "4b6f50d8cb565217d1cb74db53b5c274320e86c422ac764e1c8338b2cb7cab63"

  def install
    chdir "src" do
      system "make"
      bin.install "dgdebug", "dialogc"
    end
    doc.install Dir["docs/*"]
    prefix.install "readme.txt", "license.txt"
    pkgshare.install "stdlib.dg", "stddebug.dg"
  end

  test do
    (testpath/"test.dg").write("(program entry point) hello world")
    system bin/"dialogc", "-tz8", "test.dg"
    assert_path_exists testpath/"test.z8"
  end
end
