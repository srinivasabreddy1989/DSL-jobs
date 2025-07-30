job('my-app-build') {
    description('Builds my from Git and runs a shell script')

    scm {
        git {
            remote {
                url('https://github.com/srinivasabreddy1989/DSL-jobs.git')
                
            }
            branch('master')
        }
    }

    wrappers {
        preBuildCleanup()  // cleans workspace before build
    }
    steps {
        shell('''
            echo "Building Java project using Maven..."
            mvn clean package
        ''')
    }

    publishers {
        archiveArtifacts('target/*.jar')  // archive war file for download
    }
}
