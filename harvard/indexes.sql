CREATE INDEX "enrollments_student"
ON "enrollments"("student_id");

CREATE INDEX "enrollments_course"
ON "enrollments"("course_id");

CREATE INDEX "courses_department"
ON "courses"("department");

CREATE INDEX "courses_semester"
ON "courses"("semester");

CREATE INDEX "satisfies_course_id"
ON "satisfies"("course_id");


