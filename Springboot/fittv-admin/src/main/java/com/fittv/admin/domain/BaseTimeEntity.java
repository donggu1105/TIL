package com.fittv.admin.domain;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

@Getter
@SuperBuilder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EntityListeners(AuditingEntityListener.class)
@DynamicUpdate
@MappedSuperclass
public abstract class BaseTimeEntity {
	@CreatedDate
	@Column(name = "created_dt", nullable = false, updatable = false,
		columnDefinition = "timestamp(6) default CURRENT_TIMESTAMP(6)")
	private LocalDateTime createdDT;

	@LastModifiedDate
	@Column(name = "updated_dt", nullable = false,
		columnDefinition = "timestamp(6) default CURRENT_TIMESTAMP(6) on update CURRENT_TIMESTAMP(6)")
	private LocalDateTime updatedDT;
}
