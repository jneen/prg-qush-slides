
require "fileutils"

desc "Refresh 3rd party assets"
task :copy_assets do
  sh "git submodule init && git submodule update"

end


desc "Deploy to github pages"
task :deploy do
    sh "git diff-index --quiet HEAD --" do |ok,res|
      if !ok
        $stderr.puts "You have uncommitted changes!"
        sh "git status --short"
        exit 1
      end
    end
  sh "git branch -D gh-pages"
  sh "git checkout -b gh-pages"
  sh "middleman build"
  sh "mv build/* ."
  sh "git add ."
  sh "git status --short"
  sh "git add ."
  sh "git commit -m 'gh-pages update'"
  sh "git push origin :gh-pages"
  sh "git push origin gh-pages"
  sh "git checkout master"
end
