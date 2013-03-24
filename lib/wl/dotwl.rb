module Wl
  class Dotwl
    def login(login)
      File.write(token_path, login.token)
      File.chmod(0600, token_path)
    end

    def dir
      FileUtils.mkdir_p("#{Dir.home}/.wl", mode: 0700).last
    end

    private
    def token_path
      "#{dir}/token"
    end
  end
end
