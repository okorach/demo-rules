#!/usr/local/bin/python3

MyPublishData = """"
<publishData>
    <publishProfile
        profileName="example" publishMethod="MSDeploy"
        publishUrl="example.net:443"
        msdeploySite="example"
        userName="$example"
        userPWD="6kkBCdit4ZTfs01By2RJjgRon9ly9yqetEBZhlz8MfDhn5qKrb5yhQRnMliM" <!-- Noncompliant -->
        destinationAppUrl="https://example.net"
        SQLServerDBConnectionString=""
        mySQLDBConnectionString=""
        hostingProviderForumLink=""
        controlPanelLink="https://portal.azure.com"
        webSystem="WebSites">
        <databases/>
    </publishProfile>
</publishData>
"""

creds = "amzn.mws.3b8be74a-5f63-5960-5bad-19bd40c0ac65"

print("Hello world")
