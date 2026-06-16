class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://github.com/dialog-if/dialog/"
  url "https://github.com/Dialog-IF/dialog/releases/download/release-1c02-1.2.3/dialog-1c02-1.2.3.zip"
  version "1c02-1.2.3"
  sha256 "a12cd535d8db5c947fe2d6139536a2f2b3f57a538a7a6d283761c0eda6bf1d95"

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
