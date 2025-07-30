job('my-app-build') {
    description('Builds my app from Git and runs a shell script')

    scm {
        git {
            remote {
                url('https://github.com/srinivasabreddy1989/DSL-jobs.git')
                
            }
            branch('main')
        }
    }

    triggers {
        scm('H/5 * * * *')  // Optional: Polls Git every 5 min
    }

    steps {
        shell('''
            echo "Code pulled from Git!"
            echo "Now building..."
            ./build.sh  # You can replace with actual build steps
        ''')
    }
}
