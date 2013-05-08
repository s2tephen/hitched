# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
	Role.find_or_create_by_name({ :name => role }, :without_protection => true)
	puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

user2 = User.find_or_create_by_email :name => 'Tiffany', :email => 'tiffany@example.com', :password => 'bridezilla', :password_confirmation => 'bridezilla', :wedding_id => '1'
puts 'user: ' << user2.name
user2.add_role :user	

# POPULATE INITIAL WEDDING
Wedding.create()

# POPULATE INITIAL EVENTS

# GUESTS
Event.create(date: '2013-6-10', enabled:'true', category:'guests',  name:'Create Guest List',  notes:'Start off by creating a master list of people you want to invite. You can sort the list into groups or start grouping them by what events they will be attending, like post-wedding brunches. The list may change throughout the process, but creating a guest list early on is essential to planning the scale of the rest of your wedding. This can affect the venues you can book, how much food you have to order, and how many RSVPs, invitations and thank yous you’ll have to create and mail.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-7-18', enabled:'true', category:'guests',  name:'Reserve Hotel',  notes:'To get the best deal for your guests, reserve blocks of rooms at a couple of hotels and ask for special group rates. Keep your guests expected budget in mind and find hotels that are conveniently located.',  wedding_id:'1',  complete:'false')
Event.create(date: '2014-2-10', enabled:'true', category:'guests',  name:'Make a Seating Plan',  notes:'Guests should feel comfortable with who they sit with during the reception. Try to place people who are already friends or acquaintances at the same table. You can also take into account your guests’ personalities to determine seating arrangements.',  wedding_id:'1',  complete:'false')
Event.create(date: '2014-1-10', enabled:'true', category:'guests',  name:'Send save-the-dates',  notes:'Save-the-date invitations are sent to your guests six to eight months before your wedding. They are more low-key than formal wedding invitations, and can be sent via email or regular mail. You may also want to incorporate the theme of your wedding, (i.e, tropical destination wedding) in your save-the-date invitation.',  wedding_id:'1',  complete:'false')
Event.create(date: '2014-2-9', enabled:'true', category:'guests',  name:'Finalize RSVPs',  notes:'Your RSVP deadline should be set at least two weeks before your wedding date. Feel free to call guests who have not yet responded RSVP. Once you have a final count, you can inform your caterer, as well as your ceremony and reception venue managers.',  wedding_id:'1',  complete:'false')


# GIFTS
Event.create(date: '2013-5-17', enabled:'true', category:'gifts',  name:'Set Up a Registry',  notes:'Your wedding registry communicates your gift preferences to your guests. Select desired items from retail stores three to six months in advance, keeping in mind your guests’ expected budgets.',  wedding_id:'1',  complete:'false')
Event.create(date: '2014-8-19', enabled:'true', category:'gifts',  name:'Send Thank You Notes',  notes:'Thank you notes should be sent within three months of the wedding. Ideally, notes should be handwritten on nice stationary and thoughtfully express your gratitude.',  wedding_id:'1',  complete:'false')

# CEREMONY / RECEPTION

Event.create(date: '2013-8-14', enabled:'true', category:'ceremony',  name:'Contact Photographer',  notes:'Each photographer has his/her own style. We suggest browsing through local wedding photographers online galleries to find photographers who share your aesthetic. Then, you can contact the photographer to get pricing information and even book an engagement photo session if desired.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-5-19', enabled:'true', category:'ceremony',  name:'Book a Venue',  notes:'Booking a reception venue should be a top priority. Your venue should have areas where guests can eat, drink, talk, and dance. You should also consider the number of people the space can accommodate, lighting, views, acoustics, and parking.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-6-20', enabled:'true', category:'ceremony',  name:'Finalize DJ and Playlist',  notes:'Your DJ should be booked six to nine months in advance. Make sure your DJ knows the space and acoustic restrictions of your venue. Also, let your DJ know if there are certain songs that have sentimental value to you and discuss the genre of music that will be played.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-6-30', enabled:'true', category:'ceremony',  name:'Book Ceremony Officiant',  notes:'Ceremony officiants should be booked six months in advance. When speaking to your officiant, make sure he/she is available on the date of your wedding and can travel to your wedding location. You should also ask if the officiant charges a fee for his/her services.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-11-12', enabled:'true', category:'ceremony',  name:'Finalize Ceremony Readings and Vows',  notes:'Exchanging wedding vows can be one of the most memorable moments of your wedding. Give yourself a few weeks to write your wedding vows, keeping in mind the timing, audience, and sentimental value.',  wedding_id:'1',  complete:'false')

# FOOD

Event.create(date: '2013-9-13', enabled:'true', category:'food',  name:'Find a Caterer',  notes:'Research caterers in your area, speak to them about sample menus and prices, and arrange for a tasting if possible. Then, decide on a caterer ten to twelve months before your wedding. This will give you plenty of time to finalize menu items, location of food preparation, waitstaff, and linens & silverware. You should also discuss whether your caterer has an alcohol license and does wedding cakes.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-9-15', enabled:'true', category:'food',  name:'Find a Wedding Cake',  notes:'If your caterer does not handle wedding cakes, he/she may still give you suggestions for local bakers. When selecting a wedding cake, keep in mind the theme of your wedding, the ideal size of the cake, and your intended price. You may also find online resources, such as wedding blogs, good sources of inspiration. Once you have contacted local bakers, you can schedule cake tastings and pick the perfect cake. This should be done at least six months in advance of your wedding date.',  wedding_id:'1',  complete:'false')

# DECORATIONS

Event.create(date: '2013-12-1', enabled:'true', category:'decorations',  name:'Design Reception Decorations',  notes:'Decide on the theme of your reception and find decorations to match. Things to consider are color, mood, season, and lighting. Decoration possibilities are endless, from table centerpieces to silverware. It’s often helpful to look at wedding blogs to get inspiration on the type of decorations that will suit your wedding.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-12-5', enabled:'true', category:'decorations',  name:'Design Ceremony Decorations',  notes:'Ceremony decorations will depend on the ceremony venue you have selected and the type of ceremony you envision. Decorations may include flowers, candles, and artwork.',  wedding_id:'1',  complete:'false')
Event.create(date: '2014-2-8', enabled:'true', category:'decorations',  name:'Book Wedding Florist',  notes:'The right wedding florist will transform your space, so make sure that your florist understands your wedding vision. You can make appointments to talk to several local wedding florists to see their previous work and talk about pricing. Make sure to bring pictures of flower arrangements that you like, but do note that the season may limit which flowers are available. Wedding florists should be booked at least six months in advance.',  wedding_id:'1',  complete:'false')


# BRIDE AND GROOM

Event.create(date: '2013-7-1', enabled:'true', category:'bridegroom',  name:'Finalize wedding dress, shoes and accessories',  notes:'If you choose to have a wedding dress, then we recommend buying it five months before your wedding date. This will give you ample time for multiple rounds of fittings and alterations. If you start looking at wedding dresses early on, you may even save money during seasonal sales. Important things to keep in mind are budget, fit, and style of your ideal wedding dress.',  wedding_id:'1',  complete:'false')
Event.create(date: '2014-3-1', enabled:'true', category:'bridegroom',  name:'Find a Salon',  notes:'Depending on the area you live in, you may have to book salon appointments up to one month or more in advance. We recommend asking stylists for pictures of their previous work and showing them pictures of hair/nails that you like. Some people will even schedule dry-runs with their stylists. Alternatively, more budget-conscious brides may choose to do their own styling without the help of a professional.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-2-14', enabled:'true', category:'bridegroom',  name:'Prepare for Bachelor(ette) Party',  notes:'Your closest friends will probably be in charge of planning the bachelor(ette) parties. Make sure you let them know the type of party that you’re looking for and then enjoy!',  wedding_id:'1',  complete:'false')

# WEDDING PARTY

Event.create(date: '2014-1-11', enabled:'true', category:'party',  name:'Choose Bridesmaids and Groomsmen',  notes:'One of the first things during the planning process is to choose the maid of honor, best man, bridesmaids, and groomsmen. When selecting your wedding party, keep in mind the size of your ideal wedding.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-8-16', enabled:'true', category:'party',  name:'Finalize Groomsmen Formalwear',  notes:'You should decide whether to rent or buy formalwear for both the groom and the groomsmen, keeping in mind the style of the wedding. Sales associates at formal wear stores will often be helpful with sizing and measurements.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-9-20', enabled:'true', category:'party',  name:'Finalize Bridesmaids Dresses',  notes:'Decide on the style of bridesmaids dresses, arrange dress fittings, and confirm the dress delivery date. Give you and your bridesmaids a few months to make alterations if needed. You should also decide on bridesmaids’ accessories, as well as hair, makeup, and nails styling.',  wedding_id:'1',  complete:'false')
Event.create(date: '2013-10-10', enabled:'true', category:'party',  name:'Order Bridesmaids and Groomsmen Gifts',  notes:'Depending on your budget, you should find unique gifts for your bridesmaids and groomsmen who have helped you throughout the process. Sample bridesmaids gifts are cosmetics bags, jewelry, and picture frames. Sample groomsmen gifts are barware, sports memorabilia, and travel bags.',  wedding_id:'1',  complete:'false')





