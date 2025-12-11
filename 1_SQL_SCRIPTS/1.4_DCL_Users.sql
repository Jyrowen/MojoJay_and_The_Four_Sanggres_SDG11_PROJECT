-- ============================================
-- 1.4 DCL USERS & PERMISSIONS
-- ============================================

-- Create a user for the Disaster Management System
CREATE USER 'disaster_user'@'localhost' IDENTIFIED BY 'Disaster@123';

-- Give this user permission ONLY to use the database safely
GRANT SELECT, INSERT, UPDATE ON sdg11.* TO 'disaster_user'@'localhost';

-- Make sure this user cannot destroy the database
REVOKE DELETE, DROP, ALTER ON sdg11.* FROM 'disaster_user'@'localhost';

------------------------------------------------

-- OPTIONAL: Admin user for your group
CREATE USER 'disaster_admin'@'localhost' IDENTIFIED BY 'Admin@123';

-- Give full privileges to admin
GRANT ALL PRIVILEGES ON sdg11.* TO 'disaster_admin'@'localhost';

-- Finalize changes
FLUSH PRIVILEGES;
