----------------
-- Tiny Enums --
----------------

-- Do these first so the other tables who have enum foreign keys can reference this during insertion

INSERT INTO [TinyEnum].[LoginStatus]
	SELECT 1, 'LoginEnabled', NULL UNION
	SELECT 2, 'SetupPending', NULL UNION
	SELECT 3, 'LoginDisabled', NULL 