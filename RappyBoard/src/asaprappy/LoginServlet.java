package asaprappy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// List of possible screen names
	String[] screenNames = {"Whoopy Panda", 
			"Dimple Doll", 
			"Crazy KupKakes", 
			"Squiggly Munchkin", 
			"Sizzlin Teapot", 
			"Gold Queenie", 
			"Pinkie Cutie", 
			"Dodo Chip", 
			"Gummielicious Bling", 
			"Brown Hunnie", 
			"Fizzy Brown", 
			"Scribbly Lightning", 
			"Panda Heart", 
			"Sweet Whimsy", 
			"Ninja Rock", 
			"Secret Fruity", 
			"Blossom Cotton", 
			"Ice Huggy", 
			"Forever Bubblegum", 
			"Delicious Raspberry", 
			"Fruity Charm", 
			"Diva Tulips", 
			"Super Giggles", 
			"Butterscotch Seven", 
			"Sleepy Tinker", 
			"Fudgy Turkey", 
			"Mayflower Madame", 
			"Mystical Dimples", 
			"Kute Poopie", 
			"Twittie Sparkles", 
			"Tiger Swirlie", 
			"Triple Adorable", 
			"Bedazzzled Blue", 
			"Piggy Twinkling", 
			"Glitzy Go", 
			"Cream Smiley", 
			"Cupcake Hugs", 
			"Fairytale Daisy", 
			"Tigger Fresh", 
			"Pickle Pinkest", 
			"Dazzlin Princess", 
			"Happy Muah", 
			"Shy Snicker", 
			"Furry Dimples", 
			"Live Chic", 
			"Happy Wow", 
			"Lil Cutie", 
			"Wabbit Cherry", 
			"Prinky Doodsie", 
			"Teddie Doc", 
			"Secret Snowy", 
			"Cupid Hot", 
			"Frisbee Doodsie", 
			"Bunny Passion", 
			"Chocolatey Smile", 
			"Dimple Caramel", 
			"Petty Picnic", 
			"One Chewy", 
			"Prinky Shortiepants", 
			"Sugary Heaven", 
			"Tickle Star", 
			"Pretty Pumpkin", 
			"Warm Sunflower", 
			"Golden Tickle", 
			"Daisy Ladybird", 
			"Forever Choco", 
			"Blushy Pinkest", 
			"Circus Halo", 
			"Jelly Snowballs", 
			"Pickle Raindrops", 
			"Flying Cupid", 
			"Neon Girl", 
			"Gold Cherry", 
			"Mmm Tank", 
			"Squishy Bionic", 
			"Doozles Fairy", 
			"Honey Sparky", 
			"Beach Bionic", 
			"Songbird Garden", 
			"Peanut Mockingbird", 
			"Waffle Glitter", 
			"Icing Crystal", 
			"Rainbow Sweety", 
			"Waffle Friends", 
			"Dandelion Monster", 
			"Boogie Lollipop", 
			"Twin Dazzlin", 
			"Sugar Genius", 
			"Shiny Soo", 
			"Golden Tee", 
			"Snuggle Kitty", 
			"Gold Jewel", 
			"Dazzlin Snuggle", 
			"Genie Dolphin", 
			"Fluffy Marshmallow", 
			"Fuzzie Cherry", 
			"Magic Pizza", 
			"Delicious Cinnamon", 
			"Furry Fairytale", 
			"Chicky Kute", 
			"Spring Lucky", 
			"Star Cherrie", 
			"Miss Turkey", 
			"Autumn Spring", 
			"Secret Giggle", 
			"Raspberry Fortune", 
			"Twinkling Muah", 
			"Sweetie Wow", 
			"Trixie Grizzly", 
			"Squishy Doll", 
			"Jelly Cuddles", 
			"Boogie Neon", 
			"Hugsie Princess", 
			"Tweetie Peachie", 
			"Twilight Queenbee", 
			"Jelly Bubbly", 
			"Sugarplum Chum", 
			"Sweet Hey", 
			"Hunnie Froggie", 
			"Breezy Boo", 
			"Raspberry Trixie", 
			"Huggable Babe", 
			"Jazzie Flip", 
			"Mega Mayhem", 
			"Princess Munchkin", 
			"Me Mini", 
			"Cream Twinkie", 
			"Tiny Bubble", 
			"Cookee Chicky", 
			"Banana Fizzy", 
			"Queen Doodsie", 
			"Flip Hug", 
			"Grinning Prinky", 
			"Icy Peppermint", 
			"Blueberrie Ham", 
			"Vanilla Angelic", 
			"Girlie Chum", 
			"Cutie Bun", 
			"Fudgy Karot", 
			"Snowflakes Mega", 
			"Fancy Hunny", 
			"Polka Pinky", 
			"Dazzzled Sweetie", 
			"Scooby Bumble", 
			"Candycane Missy", 
			"Triple Girly", 
			"Tiger Kitty", 
			"Qwerty Bells", 
			"Chicken Cuddles", 
			"Bubbling Clumzie", 
			"Chatterbug Megastar", 
			"Squeezie Teapot", 
			"Dizzy Smilie", 
			"Glitzy Piggy", 
			"Magic Peach", 
			"Orange Cookie", 
			"Ultimate Angelstar", 
			"Huggable Pickle", 
			"Melon Passion", 
			"Frog Cherry", 
			"Soft Mambo", 
			"Blondie Button", 
			"Cosmopolitan Twinkles", 
			"Sweet Pearl", 
			"Sugarplum Dimple", 
			"Fizzy Madame", 
			"Cream Candycane", 
			"Chocolatey Neon", 
			"Jingle Dollie", 
			"Tinker Angel", 
			"Silhouette Hunnie", 
			"Goofy Carot", 
			"Funny Doc", 
			"Precious Pinkest", 
			"Sweetie Sweety", 
			"Chickie Magic", 
			"Miss Candied", 
			"Cryztal Blondie", 
			"Candy Salt", 
			"Diamond Guardian", 
			"Frog Light", 
			"Lolly Bling", 
			"Grizzly Turkey", 
			"Kookie Poochie", 
			"Chewy Muffin", 
			"Babycake Ballerina", 
			"Dixie Doodles", 
			"Twinkling Melody"};
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("full_name");
		String email = request.getParameter("email");
	    HttpSession session = request.getSession();  
	    session.setAttribute("fullName", fullname);
	    session.setAttribute("email", email);
		
		JDBCDriver.connect();
		
		boolean valid = false;
		
		String fieldToValidate = request.getParameter("field");
		if(fieldToValidate != null && fieldToValidate.equals("profile")) {
			PrintWriter out = response.getWriter();
			out.write((String)session.getAttribute("screenName"));
		} else {
		
			try {
				JDBCDriver.ps = JDBCDriver.conn.prepareStatement("SELECT * FROM Users WHERE email=?");
				JDBCDriver.ps.setString(1, email);
				JDBCDriver.rs = JDBCDriver.ps.executeQuery();
				if(JDBCDriver.rs.next()) { 
					// First row, if that user already in database
					// DEBUG - get user's info
					String thisEmail = JDBCDriver.rs.getString("email");
					System.out.println("The email of this logged-in user is: " + thisEmail);
					String thisName = JDBCDriver.rs.getString("fullName");
					System.out.println("The name of this logged-in user is: " + thisName);
					int thisID = JDBCDriver.rs.getInt("userID");
					System.out.println("The userID of this logged-in user is: " + Integer.toString(thisID));
					boolean thisActive = JDBCDriver.rs.getBoolean("active");
					System.out.println("The active status of this logged-in user is (should not be yet): " + thisActive);
					String screenName = JDBCDriver.rs.getString("screenName");
					System.out.println(screenName);
					
					//Set this user to active
					JDBCDriver.ps = JDBCDriver.conn.prepareStatement("UPDATE Users SET active=? WHERE userID=?");
					JDBCDriver.ps.setBoolean(1, true);
					JDBCDriver.ps.setInt(2, thisID);
					JDBCDriver.ps.executeUpdate();
					
					session.setAttribute("screenName", screenName);
					valid = true;
				}
				else { 
					// If user not already in database, add them to db and pick a random screen name
					String screenName = "";
					
					// Generate a number between 0 and 187 - only uppercase screen names
					Random rand = new Random();
					int index = rand.nextInt(188);
					screenName = screenNames[index].toUpperCase();
					System.out.println("Screen name: " + screenName);
					
					JDBCDriver.ps =  JDBCDriver.conn.prepareStatement("INSERT INTO Users (email, fullName, screenName, song, active) VALUES (?, ?, ?, ?, ?)");
					JDBCDriver.ps.setString(1, email);
					JDBCDriver.ps.setString(2, fullname);
					JDBCDriver.ps.setString(3, screenName);
					JDBCDriver.ps.setString(4, "");
					// This user is now active
					JDBCDriver.ps.setBoolean(5, true);
					JDBCDriver.ps.executeUpdate();
					
					// If we get to this point we are valid :)
					session.setAttribute("screenName", screenName);
					valid = true;
				}
			} catch (SQLException e) {
				System.out.println("SQLException in \"LoginServlet servlet \"");
				e.printStackTrace();
			} finally {
				
				// Send information to next page --> this is not working
				session.setAttribute("validRedirect", valid);
				
			}
		}
	}
}
