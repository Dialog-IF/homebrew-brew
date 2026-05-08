class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://github.com/dialog-if/dialog/"
  url "https://github.com/Dialog-IF/dialog/releases/download/release-1b01-1.2.0/dialog-1b01-1.2.0.zip"
  version "1b01-1.2.0"
  sha256 "5e2776ac8cda07484e019d91e5d15645a2a22d41320f8fb3895a9b72cf50f8e8"

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
