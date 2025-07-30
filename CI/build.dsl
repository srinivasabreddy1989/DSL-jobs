job('my-app-build') {
    description('Builds my app from Git and runs a shell script')

    scm {
        git {
            remote {
                url('https://github.com/srinivasabreddy1989/DSL-jobs.git')
                
            }
            branch('master')
        }
    }

   

    steps {
        shell('''
            echo "Code pulled from Git!"
            echo "Now building..."
            
        ''')
    }
}
