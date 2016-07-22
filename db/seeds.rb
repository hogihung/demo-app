# Create root system user account and system administration user
sysadmin = User.create(name: "sysadmin", email: 'sysadmin@mdemo-app.com', password: 'Ch@ng3MeA$ap!')
Account.create(subdomain: 'root', owner_id: sysadmin.id)

# Create a User that will be an Account owner
owner = User.create(name: "Sarah", email: 'sconner@skynet.com', password: 'pw')

# Create a demo Account to work with
account = Account.create(subdomain: 'demons-strings',  owner_id: owner.id)
