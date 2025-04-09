-- Добавляем таблицы для фотогалереи
-- Создаем таблицу для галереи
CREATE TABLE IF NOT EXISTS `PhotoGallery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `slug` VARCHAR(255) NOT NULL,
  `isPublished` BOOLEAN NOT NULL DEFAULT true,
  `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `PhotoGallery_slug_key`(`slug`)
);

-- Создаем таблицу для фотографий
CREATE TABLE IF NOT EXISTS `GalleryPhoto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255),
  `description` TEXT,
  `order` INT NOT NULL DEFAULT 0,
  `galleryId` INT NOT NULL,
  `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`galleryId`) REFERENCES `PhotoGallery`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
