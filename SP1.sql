USE MovieDemo;

DROP PROCEDURE IF EXISTS deleteMovie;

DELIMITER //

CREATE PROCEDURE deleteMovie(IN movieName VARCHAR(50))
BEGIN

  DELETE FROM Movie
  WHERE title = movieName;


END//

DELIMITER ;


