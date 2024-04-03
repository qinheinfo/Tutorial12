set.seed(0) # For reproducibility

# Step 1: Simulate the original dataset
original_data <- rnorm(n = 1000, mean = 1, sd = 1)

# Step 2: Simulate the instrument's memory issue
data_with_memory_issue <- original_data
data_with_memory_issue[901:1000] <- original_data[1:100]

# Step 3: Simulate the data cleaning mistakes

# Mistake 1: Change half of the negative values to positive
neg_indices <- which(data_with_memory_issue < 0)
indices_to_flip <- sample(neg_indices, length(neg_indices) / 2)
data_with_first_mistake <- data_with_memory_issue
data_with_first_mistake[indices_to_flip] <- -data_with_first_mistake[indices_to_flip]

# Mistake 2: Change decimal place for values between 1 and 1.1
indices_to_adjust <- which(data_with_first_mistake > 1 & data_with_first_mistake < 1.1)
data_cleaned <- data_with_first_mistake
data_cleaned[indices_to_adjust] <- data_cleaned[indices_to_adjust] / 10

# Analysis: Check the mean of the cleaned data
mean_cleaned_data <- mean(data_cleaned)

mean_cleaned_data
