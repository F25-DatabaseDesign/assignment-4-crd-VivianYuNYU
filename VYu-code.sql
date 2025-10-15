CREATE TABLE volunteer (
  volunteerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  volunteerName VARCHAR(50) NOT NULL,
  volunteerAddress VARCHAR(100) NOT NULL,
  volunteerTelephone VARCHAR(50) NOT NULL
  );
CREATE TABLE task_type (
  taskTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  taskTypeName VARCHAR(50) NOT NULL UNIQUE
  );
CREATE TABLE task_status (
  taskStatusId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  taskStatusName VARCHAR(50) NOT NULL UNIQUE
  );
CREATE TABLE packing_list (
  packingListId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  packingListName VARCHAR(50) NOT NULL UNIQUE,
  packingListDescription VARCHAR(50) NOT NULL
  );
ALTER TABLE packing_list
MODIFY COLUMN packingListDescription VARCHAR(300) NOT NULL;

CREATE TABLE task (
  taskCode INT PRIMARY KEY NOT NULL,
  packingListId INT NOT NULL,
  taskTypeId INT NOT NULL,
  taskStatusId INT NOT NULL,
  taskDescription VARCHAR(50) NULL,
  
  FOREIGN KEY(packingListId) REFERENCES packing_list(packingListId),
  FOREIGN KEY(taskTypeId) REFERENCES task_type(taskTypeId),
  FOREIGN KEY(taskStatusId) REFERENCES task_status(taskStatusId)
  );
ALTER TABLE task
MODIFY COLUMN packingListId INT NULL;
CREATE TABLE assignment (
    volunteerId INT NOT NULL,
    taskCode INT NOT NULL,
    startDateTime DATETIME NOT NULL,
    endDateTime DATETIME NULL,
     PRIMARY KEY (volunteerId, taskCode),

    FOREIGN KEY (volunteerId) REFERENCES volunteer(volunteerId),
    FOREIGN KEY (taskCode) REFERENCES task(taskCode)
);
ALTER TABLE assignment 
MODIFY COLUMN startDateTime DATE NOT NULL,
MODIFY COLUMN endDateTime DATE NULL;
CREATE TABLE package_type (
  packageTypeId INT PRIMARY KEY AUTO_INCREMENT NOT NUlL,
  packageTypeName VARCHAR(50) NOT NULL UNIQUE
  );
CREATE TABLE package (
  packageId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  taskCode INT NOT NULL,
  packageTypeId INT NOT NULL,
  packageCreateDate DATE NOT NULL,
  packageWeight DECIMAL(5,2) NOT NULL,
  
  FOREIGN KEY (taskCode) REFERENCES task(taskCode),
  FOREIGN KEY (packageTypeId) REFERENCES package_type(packageTypeId)
  );
CREATE TABLE item (
  itemId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  itemDescription VARCHAR(50) NOT NULL,
  itemValue DECIMAL(6,2) NOT NULL,
  quantityOnHand INT NOT NULL DEFAULT 0
  );
CREATE TABLE package_contents (
  itemId INT NOT NULL,
  packageId INT NOT NULL,
  itemQuantity INT NOT NULL CHECK (itemQuantity > 0),
  PRIMARY KEY (itemId,packageId),
  
  FOREIGN KEY (itemId) REFERENCES item(itemId),
  FOREIGN KEY (packageId) REFERENCES package(packageId)
  );
INSERT INTO volunteer (volunteerId, volunteerName, volunteerAddress, volunteerTelephone)
VALUES
(1, "Alice", "181 Mercer Street", "(212) 555-1843"),
(2, "Tom", "87 White Street", "(646) 555-9276"),
(3, "Bianca", "636 Greenwich Street", "(917) 555-3029"),
(4, "Eric", "33 Third Avenue", "(347) 555-7604"),
(5, "Sam", "33 Washington Square West", "(718) 555-6210"),
(6, "Daivd", "120 East 12th Street", "(929) 555-4785"),
(7, "Helen", "181 Mercer Street", "(332) 555-1108"),
(8, "Jeniffer", "140 East 14th Street", "(516) 555-2389"),
(9, "Jack", "33 Third Avenue", "(914) 555-7742"),
(10, "May", "120 East 12th Street", "(607) 555-9315");

INSERT INTO task_type (taskTypeId, taskTypeName)
VALUES
(132, "recurring"),
(133, "packing"),
(134, "delivery"),
(135, "cleanup");

INSERT INTO task_status (taskStatusId, taskStatusName)
VALUES
(10, "open"),
(11, "ongoing"),
(12, "completed"),
(13, "pending");

INSERT INTO packing_list (packingListId, packingListName, packingListDescription)
VALUES
(301, "basic medical packages", "200 first-aid packets and 200 bandages"),
(302, "women care packages", "100 sanitary pads and 100 tampons"),
(303, "children care packages", "50 toys, 50 books, and 100 bottles of milk"),
(304, "basic food packages", "50 bags of rice, 300 bags of bread, 50 bottles of milk, 200 bottles of water, and 30 packages of cookies"),
(305, "Hygiene packages", "50 soaps, 50 toothpastes, 50 toothbrushes, and 50 towels");

INSERT INTO package_type (packageTypeId, packageTypeName)
VALUES
(51, "basic medical"),
(52, "child-care"),
(53, "women care"),
(54, "food"),
(55, "hygiene");

INSERT INTO item (itemId, itemDescription, itemValue, quantityOnHand)
VALUES
(501, "bottled water(1L)", 3.5, 5000),
(502, "baged rice(2kg)", 5, 3000),
(503, "baged bread(500g)", 2, 10000),
(504, "bottled milk(1L)", 5.5, 4000),
(505, "bandages", 2.25, 7000),
(506, "toothpaste(tube)", 1.75, 3000),
(507, "toothbrush", 3.25, 3000),
(508, "towel", 2, 3000),
(509, "first-aid packets", 15, 5000),
(510, "sanitary pads(20 pack)", 8.5, 4000),
(511, "tampons(20 pack)", 6, 4000),
(512, "soap", 1.75, 5000),
(513, "toy", 20, 1000),
(514, "book", 10, 1500),
(515, "cookie(package)", 4.5, 2000);

INSERT INTO task(taskCode, packingListId, taskTypeId, taskStatusId, taskDescription)
VALUES
(101, NULL, 132, 10, "answer the telephone"),
(102, 301, 133, 10, "prepare basic medical packages"),
(103, NULL, 132, 11, "update volunteer contact information"),
(104, NULL, 134, 12, "transport packages to storage center"),
(105, NULL, 135, 13, "clean up packaging area"),
(106, 303, 133, 11, "pack 50 children care packages"),
(107, 305, 133, 12, "prepare hygiene packages"),
(108, NULL, 132, 11, "check and restore items"),
(109, 304, 133, 13, "prepare basic food packages"),
(110, 302, 133, 11, "prepare women care packages");

INSERT INTO assignment (volunteerId, taskCode, startDateTime, endDateTime)
VALUES
(1, 101, "2025-09-01", "2025-10-01"),
(1, 102, "2025-09-15", NULL),
(1, 110, "2025-09-01", "2025-10-01"),
(2, 102, "2025-07-18", "2025-09-18"),
(3, 106, "2025-08-08", "2025-08-31"),
(3, 107, "2025-08-08", "2025-08-31"),
(4, 103, "2025-06-24", "2025-09-24"),
(5, 108, "2025-06-01", "2025-07-01"),
(6, 104, "2025-07-01", "2025-08-31"),
(7, 108, "2025-08-11", "2025-09-20"),
(10, 101, "2025-09-01", "2025-10-01");

INSERT INTO package(packageId, taskCode, packageTypeId, packageCreateDate, packageWeight)
VALUES
(1001, 102, 51, "2025-09-20", 5.8),
(1002, 102, 51, "2025-10-03", 7.2),
(1003, 106, 52, "2025-08-07", 3.8),
(1004, 107, 55, "2025-09-01", 4.0),
(1005, 107, 55, "2025-10-01", 3.2),
(1006, 109, 54, "2025-08-22", 20.7),
(1007, 110, 53, "2025-09-21", 0.8),
(1008, 110, 53, "2025-10-04", 3.3),
(1009, 102, 51, "2025-07-31", 2.1),
(1010, 106, 52, "2025-06-21", 5.3);

INSERT INTO package_contents (itemId, packageId, itemQuantity)
VALUES
(501, 1006, 10),
(502, 1006, 5),
(503, 1006, 10),
(504, 1006, 5),
(505, 1001, 20),
(505, 1002, 15),
(506, 1004, 10),
(506, 1005, 20),
(507, 1004, 10),
(508, 1005, 20),
(509, 1001, 12),
(510, 1007, 15),
(511, 1007, 18),
(512, 1004, 8),
(513, 1003, 12),
(514, 1003, 10),
(514, 1010, 5),
(515, 1006, 20);


