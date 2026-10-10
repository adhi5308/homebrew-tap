cask "keythock" do
  version "0.1.1"
  sha256 "4218e37a49a0e388ac2f14f40f2357fc832c4636087bf5febaef2bafb21c5d69"

  url "https://github.com/adhi5308/KeyThock/releases/download/v#{version}/KeyThock-#{version}.zip"
  name "KeyThock"
  desc "Menu-bar mechanical keyboard sounds for macOS"
  homepage "https://github.com/adhi5308/KeyThock"

  depends_on macos: ">= :ventura"

  app "KeyThock.app"

    # KeyThock listens for keyboard events only after the user grants macOS
  # Accessibility permission. It records and sends no keystroke data.
  postflight do
    quarantine = "/usr/bin/xattr"
    system_command quarantine, args: ["-dr", "com.apple.quarantine", "#{appdir}/KeyThock.app"], sudo: false
  end
end
