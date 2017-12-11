# MIT License
#
# Copyright (c) 2017 appPlant
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation tasks (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

namespace :build do
  desc 'Build appplant/mruby-cli:glibc-2.12'
  task :glibc_2_12 do
    sh 'docker build -f Dockerfile.glibc-2.12 -t appplant/mruby-cli:glibc-2.12 .'
  end

  desc 'Build appplant/mruby-cli:glibc-2.14'
  task :glibc_2_14 do
    sh 'docker build -f Dockerfile.glibc-2.14 -t appplant/mruby-cli:glibc-2.14 .'
  end

  desc 'Build appplant/mruby-cli:musl'
  task :musl do
    sh 'docker build -f Dockerfile.musl -t appplant/mruby-cli:musl .'
  end
end

namespace :shell do
  desc 'Shell into appplant/mruby-cli:glibc-2.12'
  task :glibc_2_12 do
    sh 'docker run -ti appplant/mruby-cli:glibc-2.12 /bin/bash -l'
  end

  desc 'Shell into appplant/mruby-cli:glibc-2.14'
  task :glibc_2_14 do
    sh 'docker run -ti appplant/mruby-cli:glibc-2.14 /bin/bash -l'
  end

  desc 'Shell into appplant/mruby-cli:musl'
  task :musl do
    sh 'docker run -ti appplant/mruby-cli:musl /bin/sh -l'
  end
end

namespace :push do
  desc 'Push appplant/mruby-cli:glibc-2.12'
  task :glibc_2_12 do
    sh 'docker push appplant/mruby-cli:glibc-2.12'
  end

  desc 'Push appplant/mruby-cli:glibc-2.14'
  task :glibc_2_14 do
    sh 'docker push appplant/mruby-cli:glibc-2.14'
  end

  desc 'Push appplant/mruby-cli:musl'
  task :musl do
    sh 'docker push appplant/mruby-cli:musl'
  end
end
