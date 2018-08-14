# lead_capture

Simple Lead Capture Service

Appends the form data as JSON to the end of a data file, then redirects to a
landing page.

Intended to be used for lead-capture from a static-html website.

## Running

    $ docker run -p 4567:4567 casmacc/lead_capture

## Environment Variables

    REDIRECT_PATH - the redirect page after 
    OUTPUT_DIR    - the directory which holds the data file
    ACCESS_PWD    - password to view `/data/:pwd`

## Building

    $ docker build . -t casmacc/lead_capture
    $ docker push
