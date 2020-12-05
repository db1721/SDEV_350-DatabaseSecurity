$conn = getDB($databaseAccessUsername, $databaseAccessPassword);

if (passwordComplexity($pwd)== true)
{
    echo 'Password is valid!';
}
else
{
    echo 'Invalid password.';
}

if (passwordEncryption($pwd)== true)
{
    echo 'Password is encrypted!';
}
else
{
    echo 'Password cannot be encypted.';
}

$sql = "CREATE PROFILE NewProfile LIMIT
	PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION
	SESSIONS_PER_USER 3
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME 120
	PASSWORD_LOCK_TIME 1/24;
CREATE USER LoggedInUser
    IDENTIFIED BY LoggedInUser
    DEFAULT TABLESPACE Users
    QUOTA 30M ON Users
    PROFILE NewProfile
CREATE ROLE DBRole;
GRANT alter table, select, insert TO DBRole;
ALTER ROLE DBRole ADD MEMBER LoggedInUser

$stmt = $pdo->prepare("SELECT id, firstname, lastname, salary, birth, ssn,
phonenumber, address, email, nickname, Password
FROM data WHERE id = :input_id and password = :input_password");
$stmt->execute(array('input_id' => $id));
foreach ($stmt as $row)
{
    //verify the statement for each row
}

UPDATE data
SET nickname='$nickname',
email='$email',
address='$address',
phonenumber='$phonenumber',
Password= '$pwd',
Firstname = '$firstname',
Lastname = '$lirstname'
WHERE id= '$id' ";

$conn->query($sql))

$conn = getDB();
$sql = "SELECT id, firstname, lastname, salary, birth, ssn,
phonenumber, address, email, nickname, Password
FROM data
WHERE id= '0 OR 1=1'";
$result = $conn->query($sql))

$conn->close();
