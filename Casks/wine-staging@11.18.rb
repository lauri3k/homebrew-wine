# Based on the Homebrew wine@staging cask (BSD-2-Clause License):
# https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/w/wine@staging.rb
# Modifications: pinned to a specific version, Gatekeeper `disable!` removed.

cask "wine-staging@11.18" do
  version "11.18"
  sha256 "b63704b91af269bc026a87f12bd297c4a50caaf570c322e600b6621ef918f127"

  url "https://github.com/Gcenx/macOS_Wine_builds/releases/download/#{version}/wine-staging-#{version}-osx64.tar.xz"
  name "WineHQ-staging"
  desc "Compatibility layer to run Windows applications"
  homepage "https://wiki.winehq.org/MacOS"

  livecheck do
    skip "Pinned version"
  end

  conflicts_with cask: [
    "wine-stable",
    "wine@devel",
    "wine@staging",
  ]
  depends_on cask: "lauri3k/wine/gstreamer-runtime"
  depends_on :macos

  app "Wine Staging.app"
  dir_path = "#{appdir}/Wine Staging.app/Contents/Resources"
  binary "#{dir_path}/start/bin/appdb"
  binary "#{dir_path}/start/bin/winehelp"
  binary "#{dir_path}/wine/bin/msidb"
  binary "#{dir_path}/wine/bin/msiexec"
  binary "#{dir_path}/wine/bin/notepad"
  binary "#{dir_path}/wine/bin/regedit"
  binary "#{dir_path}/wine/bin/regsvr32"
  binary "#{dir_path}/wine/bin/wine"
  binary "#{dir_path}/wine/bin/wineboot"
  binary "#{dir_path}/wine/bin/winecfg"
  binary "#{dir_path}/wine/bin/wineconsole"
  binary "#{dir_path}/wine/bin/winedbg"
  binary "#{dir_path}/wine/bin/winefile"
  binary "#{dir_path}/wine/bin/winemine"
  binary "#{dir_path}/wine/bin/winepath"
  binary "#{dir_path}/wine/bin/wineserver"

  zap trash: [
        "~/.local/share/applications/wine*",
        "~/.local/share/icons/hicolor/**/application-x-wine*",
        "~/.local/share/mime/application/x-wine*",
        "~/.local/share/mime/packages/x-wine*",
        "~/.wine",
        "~/.wine32",
        "~/Library/Saved Application State/org.winehq.wine-staging.wine.savedState",
      ],
      rmdir: [
        "~/.local/share/applications",
        "~/.local/share/icons",
        "~/.local/share/mime",
      ]

  caveats do
    requires_rosetta
  end
end
