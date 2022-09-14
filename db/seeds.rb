# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
LicenseCategory.create([
     { name: 'Life Insurance' },
     { name: 'Health Insurance' },
     { name: 'Series 6' },
     { name: 'Series 7' },
     { name: 'Series 57 / 65 / Other' },
     { name: 'Real Estate' },
     { name: 'CPA' },
     { name: 'P&C' }]
)

ProductCategory.create([
     { name: 'Life Insurance' },
     { name: 'Health Insurance' },
     { name: 'Living Benefits Term' },
     { name: 'Long Term Care' },
     { name: 'Universal / IUL' },
     { name: 'Disability' },
     { name: 'Whole LIfe' },
     { name: 'Medicare Supplement' },
     { name: 'Indexed Annuities' },
     { name: 'Variable Annuities' },
     { name: 'Mutual Funds' },
     { name: 'Stocks & Bonds' },
     { name: 'Home Owner’s' },
     { name: 'Car Insurance' },
     { name: 'Other P&C Lines' }]
)
CarrierCategory.create([
     { name: 'AIG' },
     { name: 'Allstate' },
     { name: 'Allianz' },
     { name: 'American-Amicable' },
     { name: 'American Equity' },
     { name: 'American Financial' },
     { name: 'AXA' },
     { name: 'Baltimore Life' },
     { name: 'Gerber Life' },
     { name: 'Genworth' },
     { name: 'Globe Life' },
     { name: 'Guardian Life' },
     { name: 'Hartford Financial' },
     { name: 'Humana, Inc' },
     { name: 'John Hancock' },
     { name: 'Kemper' },
     { name: 'Liberty Mutual' },
     { name: 'Lincoln National' },
     { name: 'Loews Corp' },
     { name: 'MassMutual' },
     { name: 'MetLife' },
     { name: 'Minnesota Life' },
     { name: 'Mutual of Omaha' },
     { name: 'New York Life' },
     { name: 'Nationwide Mutual' },
     { name: 'North American' },
     { name: 'Ohio National' },
     { name: 'OneAmerican Financial' },
     { name: 'Oxford Life' },
     { name: 'Pacific Life' },
     { name: 'Phoenix' },
     { name: 'Principal Financial' },
     { name: 'Progressive Corp' },
     { name: 'Protective' },
     { name: 'Prudential' },
     { name: 'Settlers Life' },
     { name: 'State Farm' },
     { name: 'Transamerica' },
     { name: 'Travelers Companies' },
     { name: 'Voya'},
])
NewsCategory.create([
     { name: 'CNN Money' },
     { name: 'Wall Street Journal' },
     { name: 'The Verge' },
     { name: 'CNN' },
     { name: 'Bloomberg Business' },
     { name: 'Motley Fool' },
     { name: 'Fox News' },
     { name: 'Reuters' },
     { name: 'Forbes' },
     { name: 'TIME' },
     { name: 'Buzzfeed' },
     { name: 'MSNBC' },
])

Admin.find_or_create_by(email: 'daipangchi@gmail.com') do |t|
     t.username = 'sokom'
     t.password = 'flygare10'
end
Admin.find_or_create_by(email: 'ryangeyer@gmail.com') do |t|
     t.username = 'ryan'
     t.password = 'Orbis123'
end