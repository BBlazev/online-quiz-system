﻿using System;
using System.Collections.Generic;

namespace OnlineQuizSystemApi.Models;

public partial class Quiz
{
    public int Id { get; set; }

    public int ProfessorId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime? DateCreated { get; set; }

    public int? TimeLimit { get; set; }

    public bool? IsPublished { get; set; }

    public int? CourseId { get; set; }

    public virtual Course? Course { get; set; }

    public virtual User Professor { get; set; } = null!;

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<QuizAttempt> QuizAttempts { get; set; } = new List<QuizAttempt>();
}
